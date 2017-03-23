require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rdoc/task'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end

rdoc_task_names = {
  rdoc: 'rdoc',
  clobber_rdoc: 'rdoc:clean',
  rerdoc: 'rdoc:force'
}

RDoc::Task.new(rdoc_task_names) do |t|
  t.rdoc_files.include('README.md', 'lib/**/*.rb')
  t.title     = 'pr0gramm API Gem Documentation'
  t.main      = 'README.md'
  t.rdoc_dir  = 'doc'
  t.generator = 'hanna'
end

desc 'rdoc + test'
task default: [:rdoc, :test]

