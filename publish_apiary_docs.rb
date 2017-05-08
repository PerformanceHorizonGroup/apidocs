require 'git'

`mkdir #{Dir.pwd}/.public`

`mkdir #{Dir.pwd}/tmp`
`rsync -avz --exclude 'tmp' . #{Dir.pwd}/tmp/`

main_repo = Git.open(Dir.pwd)
branches = main_repo.branches.remote

cloned_repo = Git.open("#{Dir.pwd}/tmp")

branches.each do |branch|
  if branch.remote.name == "origin"
    unless branch.name.include?('->')
      cloned_repo.checkout(branch.name)
      `make -C #{Dir.pwd}/tmp`
      puts "Publishing apiary docs for branch #{branch.name}"
      `mkdir -p #{Dir.pwd}/.public/#{branch.name}`

      output_path = "#{Dir.pwd}/.public/#{branch.name}/index.html"
      `apiary preview --path=\"#{Dir.pwd}/tmp/apiary.apib\" --output=\"#{document_path}\"`
      replace_title(branch, output_path)

    end
  end
end

`rm -rf #{Dir.pwd}/tmp`
`mv #{Dir.pwd}/.public #{Dir.pwd}/public`


def replace_title(branch, document_path)
	text = File.read(document_path) 
	content = text.gsub(/search_regexp/, "<title> Apiary - #{branch.name} </title>")
	File.open(filename, "w") { |file| file << content }
end