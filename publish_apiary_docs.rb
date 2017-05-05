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
      `make -C #{Dir.pwd}/tmp`
      cloned_repo.checkout(branch.name)
      puts "Publishing apiary docs for branch #{branch.name}"
      `mkdir -p #{Dir.pwd}/.public/#{branch.name}`
      `apiary preview --path=\"#{Dir.pwd}/tmp/apiary.apib\" --output=\"#{Dir.pwd}/.public/#{branch.name}/index.html\"`
    end
  end
end

`rm -rf #{Dir.pwd}/tmp`
`mv #{Dir.pwd}/.public #{Dir.pwd}/public`
