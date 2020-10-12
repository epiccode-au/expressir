#!/usr/bin/env ruby

require 'expressir'
require 'expressir/express_exp/parser'

# This file is from:
# https://github.com/metanorma/annotated-express/blob/master/data/resources/action_schema/action_schema.exp
file = 'action_schema.exp'

# repo = Expressir::ExpressExp::Parser.from_exp(file)
# schema = repo.schemas.find{|schema| schema.id == "support_resource_schema"}

repo = Expressir::ExpressExp::Parser.from_exp(file)
schema = repo.schemas.find{|schema| schema.id == "action_schema"}
entity = schema.entities.find{|entity| entity.id == "action_directive_relationship"}
where = entity.where.find{|where| where.id == "WR1"}

puts where.inspect
