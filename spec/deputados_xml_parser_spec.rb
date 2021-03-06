require 'spec_helper'

describe DeputadoXMLParser do
  before do
    stub_request(:get, 'http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados').
      to_return(:status => 200, :body => File.read('spec/fixtures/deputados.xml'))
  end

  describe '#deputados' do
    it 'returns 5 register' do
      expect(subject.deputados.count).to eq(5)
    end

    it 'returns deputados info' do
      expect(subject.deputados.map{|d| d[:cadastro_id] }).to eq(["74016", "74210", "74319", "74324", "74421"])
      expect(subject.deputados.first.keys).to eq([:cadastro_id, :parlamentar_id, :nome, :nome_parlamentar, :sexo, :uf, :partido, :gabinete, :anexo, :fone, :email, :comissoes])
    end
  end
end
