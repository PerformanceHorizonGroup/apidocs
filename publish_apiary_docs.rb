require 'git'

`mkdir #{Dir.pwd}/.public`

`make`

g = Git.open(Dir.pwd)

branches = g.branches.remote

branches.each do |branch|
	if branch.remote.name == "origin"
		unless branch.name.include?('->')
			puts "Publishing apiary docs for branch #{branch.name}"
			`mkdir -p #{Dir.pwd}/.public/#{branch.name}`
			`apiary preview --path=\"#{Dir.pwd}/apiary.apib\" --output=\"#{Dir.pwd}/.public/#{branch.name}/index.html\"`
		end
	end
end

`mv #{Dir.pwd}/.public #{Dir.pwd}/public`
