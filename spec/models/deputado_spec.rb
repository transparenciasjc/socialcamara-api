# encoding: utf-8
#
require 'spec_helper'

describe Deputado do
  #it { should validate_uniqueness_of(:cadastro_id) }
  #it { should validate_uniqueness_of(:nome_parlamentar) }
  it { should validate_presence_of(:nome_parlamentar) }
  it { should validate_presence_of(:cadastro_id) }
  it { should have_many(:cotas) }

  describe "update_path" do
    it "set uri" do
      deputado = Deputado.create! nome_parlamentar: "Duke Khaos", cadastro_id: 1
      expect(deputado.uri).to eq('duke-khaos')
    end
    it "transliterate" do
      deputado = Deputado.create! nome_parlamentar: "Duké Khãos", cadastro_id: 1
      expect(deputado.uri).to eq('duke-khaos')
    end
  end
end
