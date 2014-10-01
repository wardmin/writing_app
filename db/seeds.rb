# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ProjectType.create([{ name: 'novel'}, {name: 'screenplay'}, {name: 'stage play'}, {name: 'essay'}, {name: 'short story'}, {name: 'poem'}, {name: 'app'}, {name: 'other'}])
GoalType.create([{name: 'Brainstorming'}, {name: 'researching'}, {name: 'outlining'}, {name: 'writing the first draft'}, {name: 'writing a second draft'}, {name: 'writing an nth draft'}, {name: 'editing'}, {name: 'rewriting'}, {name: 'polishing'}, {name: 'sending'}, {name: 'submitting'}])
Genre.create([{name: 'Novelist'}, {name: 'Screenwriter'}, {name: 'Playwright'}, {name: 'Poet'}, {name: 'Essayist'}, {name: 'Journalist'}, {name: 'Programmer'}])
Metric.create([{name: 'words'}, {name: 'pages'}, {name: 'lines'}, {name: 'other'}, {name: 'none'}])