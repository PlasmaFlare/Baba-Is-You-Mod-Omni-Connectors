function calculatesentences(unitid,x,y,dir)
	local drs = dirs[dir]
	local ox,oy = drs[1],drs[2]
	
	local finals = {}
	local sentences = {}
	local sents = {}
	local done = false
	
	local step = 0
	local combo = {}
	local variantshere = {}
	local totalvariants = 1
	local maxpos = 0
	
	local limiter = 3000
	
	local combospots = {}
	
	local unit = mmf.newObject(unitid)
	
	local done = false
	while (done == false) and (totalvariants < limiter) do
		local words,letters,jletters = codecheck(unitid,ox*step,oy*step,dir,true)
		
		--MF_alert(tostring(unitid) .. ", " .. unit.strings[UNITNAME] .. ", " .. tostring(#words))
		
		step = step + 1
		
		if (totalvariants >= limiter) then
			MF_alert("Level destroyed - too many variants A")
			destroylevel("toocomplex")
			return nil
		end
		
		if (totalvariants < limiter) then
			if (#words > 0) then
				totalvariants = totalvariants * #words
				variantshere[step] = #words
				sents[step] = {}
				combo[step] = 1
				
				if (totalvariants >= limiter) then
					MF_alert("Level destroyed - too many variants B")
					destroylevel("toocomplex")
					return nil
				end
				
				if (#words > 1) then
					combospots[#combospots + 1] = step
				end
				
				if (totalvariants > #finals) then
					local limitdiff = totalvariants - #finals
					for i=1,limitdiff do
						table.insert(finals, {})
					end
				end
				
				for i,v in ipairs(words) do
					--unitids, width, word, wtype, dir
					
					--MF_alert("Step " .. tostring(step) .. ", word " .. v[3] .. " here")
					
					table.insert(sents[step], v)
				end
			else
				--MF_alert("Step " .. tostring(step) .. ", no words here, " .. tostring(letters) .. ", " .. tostring(jletters))
				
				if jletters then
					variantshere[step] = 0
					sents[step] = {}
					combo[step] = 0
				else
					done = true
				end
			end
		end
	end
	
	--MF_alert(tostring(step) .. ", " .. tostring(totalvariants))
	
	if (totalvariants >= limiter) then
		MF_alert("Level destroyed - too many variants C")
		destroylevel("toocomplex")
		return nil
	end
	
	maxpos = step
	
	local combostep = 0
	
	for i=1,totalvariants do
		step = 1
		sentences[i] = {}
		
		while (step < maxpos) do
			local c = combo[step]
			
			if (c ~= nil) then
				if (c > 0) then
					local s = sents[step]
					local word = s[c]
					
					local w = word[2]
					
					--MF_alert(tostring(i) .. ", step " .. tostring(step) .. ": " .. word[3] .. ", " .. tostring(#word[1]) .. ", " .. tostring(w))
					
					table.insert(sentences[i], {word[3], word[4], word[1], word[2]})
					
					step = step + w
				else
					break
				end
			else
				MF_alert("c is nil, " .. tostring(step))
				break
			end
		end
		
		if (#combospots > 0) then
			combostep = 0
			
			local targetstep = combospots[combostep + 1]
			
			combo[targetstep] = combo[targetstep] + 1
			
			while (combo[targetstep] > variantshere[targetstep]) do
				combo[targetstep] = 1
				
				combostep = (combostep + 1) % #combospots
				
				targetstep = combospots[combostep + 1]
				
				combo[targetstep] = combo[targetstep] + 1
			end
		end
	end
	
	--[[
	MF_alert(tostring(totalvariants) .. ", " .. tostring(#sentences))
	for i,v in ipairs(sentences) do
		local text = ""
		
		for a,b in ipairs(v) do
			text = text .. b[1] .. " "
		end
		
		MF_alert(text)
	end
	]]--
	
	return sentences,finals,maxpos,totalvariants
end