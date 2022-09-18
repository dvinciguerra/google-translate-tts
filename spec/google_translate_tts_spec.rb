# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GoogleTranslateTts do
  subject(:fetch_translation) do
    described_class.fetch(phrase, **options)
  end

  describe '.fetch' do
    let(:response) { double(body: '') }

    let(:phrase) { 'Hello' }
    let(:options) { {} }

    before do
      allow(Faraday)
        .to receive(:get)
        .and_return(response)
    end

    before(:each) { fetch_translation }

    it 'calls http get using defalts' do
      expect(Faraday)
        .to have_received(:get)
        .with(
          be_start_with('http://translate.google.com/translate_tts')
            .and(include 'q=Hello')
            .and(match 'tl=en')
        )
    end

    context 'with custom lang argument' do
      let(:phrase) { 'Hola' }
      let(:options) { { lang: 'es' } }

      it 'calls http get using es' do
        expect(Faraday)
          .to have_received(:get)
          .with(
            include('q=Hola')
              .and(match('tl=es'))
          )
      end
    end

    context 'with phrase using special chars' do
      let(:phrase) { 'Olá, como vai você?' }
      let(:options) { { lang: 'pt' } }

      it 'encodes url param special characters' do
        encoded_phrase = 'Ol%C3%A1%2C+como+vai+voc%C3%AA%3F'

        expect(Faraday)
          .to have_received(:get)
          .with(
            include("q=#{encoded_phrase}")
              .and(match('tl=pt'))
          )
      end
    end
  end
end
