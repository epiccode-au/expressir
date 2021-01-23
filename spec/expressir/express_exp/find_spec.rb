require "spec_helper"
require "expressir/express_exp/parser"

RSpec.describe Expressir::Model::Scope do
  describe ".find" do
    it "finds an item" do
      repo = Expressir::ExpressExp::Parser.from_exp(sample_file)

      schema = repo.find("syntax_schema")
      expect(schema).to be_instance_of(Expressir::Model::Schema)

      entity = repo.find("syntax_schema.empty_entity")
      expect(entity).to be_instance_of(Expressir::Model::Entity)

      attribute = repo.find("syntax_schema.attribute_entity.test")
      expect(attribute).to be_instance_of(Expressir::Model::Attribute)

      where = repo.find("syntax_schema.where_label_entity.wr:WR1")
      expect(where).to be_instance_of(Expressir::Model::Where)
    end
  end

  def sample_file
    @sample_file ||= Expressir.root_path.join(
      "original", "examples", "syntax", "syntax.exp"
    )
  end
end