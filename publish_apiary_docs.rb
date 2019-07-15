#encoding: utf-8
require 'git'

def replace_title(branch, document_path)
	text = File.read(document_path)
	content = text.gsub(/\<title\>apiary\<\/title\>/, "<title>Apiary - #{branch.name}</title>")
	File.open(document_path, "w") { |file| file << content }
end


`mkdir #{Dir.pwd}/.public`
`mkdir #{Dir.pwd}/tmp`
`rsync -avz --exclude 'tmp' . #{Dir.pwd}/tmp/`

main_repo = Git.open(Dir.pwd)
branches = main_repo.branches.remote

cloned_repo = Git.open("#{Dir.pwd}/tmp")

branches.each do |branch|
  if branch.remote.name == "origin"
    unless branch.name.include?('->')
			unless branch.name.include?('patch-1')
	      cloned_repo.checkout(branch.name)
				`npm install`
	      `make -C #{Dir.pwd}/tmp`
	      puts "Publishing apiary docs for branch #{branch.name}"
	      `mkdir -p #{Dir.pwd}/.public/#{branch.name}`

	      document_output_path = "#{Dir.pwd}/.public/#{branch.name}/index.html"
	      `apiary preview --path=\"#{Dir.pwd}/tmp/apiary.apib\" --output=\"#{document_output_path}\"`
	      replace_title(branch, document_output_path)
			end
    end
  end
end

`rm -rf #{Dir.pwd}/tmp`
`mv #{Dir.pwd}/.public #{Dir.pwd}/public`
