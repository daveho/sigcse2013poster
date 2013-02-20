#! /usr/bin/ruby

# Generate guest accounts for demo server

@rng = Random.new()

def randpw
	# Don't use l/1 or o/0
	ch = "abcdefghjklmnpqrstuvwxyz23456789"

	pw = ""
	8.times do |n|
		pw << ch[@rng.rand(ch.length)]
	end

	return pw
end

ccout = File.open("ccaccts.txt", "w");
labelout = File.open("cclabels.csv", "w");

labelout.puts "uname,pword"

(1..78).each do |n|
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
