function retry
	eval $argv; or retry $argv
end
