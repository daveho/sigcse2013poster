#! /usr/bin/ruby

# Generate guest accounts for demo server

#@rng = Random.new()

def randpw
	# Don't use l/1 or o/0
	ch = "abcdefghjkmnpqrstuvwxyz23456789"

	pw = ""
	8.times do |n|
		#i = @rng.rand(ch.length)
		i = rand(ch.length)
		pw << ch[i]
	end

	return pw
end

ccout = File.open("ccaccts.txt", "w");
labelout = File.open("cclabels.csv", "w");

#labelout.puts "uname,pword"

(81..160).each do |n|
	#puts "guest#{n}"

	username = "guest#{n}"
	password = randpw()
	fname = "Guest"
	lname = "#{n}"
	email = "guest#{n}@demo.cloudcoder.org"

	ccout.puts [username, fname, lname, email, password].join("\t")
	labelout.puts "#{username},#{password}"
end

ccout.close()
labelout.close()

# vim:ts=2:
