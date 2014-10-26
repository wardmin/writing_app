# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ProjectType.create([{ name: 'novel'}, {name: 'screenplay'}, {name: 'stage play'}, {name: 'essay'}, {name: 'short story'}, {name: 'poem'}, {name: 'app'}, {name: 'other'}])
GoalType.create([{name: 'Brainstorming'}, {name: 'researching'}, {name: 'outlining'}, {name: 'writing'}, {name: 'editing'}, {name: 'rewriting'}, {name: 'polishing'}, {name: 'sending'}, {name: 'submitting'}])
Metric.create([{name: 'words'}, {name: 'pages'}, {name: 'lines'}, {name: 'other'}, {name: 'none'}])