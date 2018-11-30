function [compF, index, positiveCofactor, negativeCofactor] = Complement (cubeList, nbrVar)
 compF=[];
 index = 0;
 positiveCofactor = [];
 negativeCofactor = [];
  #Check if cubeList is empty; if that's the case, its complement is 
  #an all don't care cube
 if(length (cubeList) == 0)
    for varIndex = 1 : nbrVar
       compF =[compF 3];
    endfor
    return;
 endif
 #Check weither there is an all don't care cube in the cubeList
 #if it's the case, complement is 0
 for cubeIndex = 1 : length (cubeList (:, 1))
   allDontCareCube = 1;
   for varIndex = 1 : length (cubeList (1, :))
     if (cubeList (cubeIndex, varIndex) != 3)
       allDontCareCube = 0;
     endif
   endfor
   if (allDontCareCube)
     compF = [];
     return;
   endif
 endfor
 
 #If cubeList contains only one cube, demorgan rule can be applied
 if (length (cubeList(:, 1)) == 1)
   for varIndex = 1 : length (cubeList(1,:))
     demorganCube = 3* ones(1, nbrVar);
     if (cubeList (1, varIndex) == 3) #if variable is not "there" (don't care) 
       demorganCube = [];             #demorgan cube is empty
     elseif (cubeList (1,varIndex)==2)
       demorganCube (1, varIndex)= 1;
     elseif (cubeList (1,varIndex) == 1)
       demorganCube (1,varIndex) = 2;
     endif
     compF = [compF; demorganCube];
   endfor
   return;
 
 else
################### first, determine which variable to use #####################
  chosenVar = 0;                    
  mostBalancedVar = -1;
  balancesVariables = [];
  for varIndex = 1 : length (cubeList(1,:)) #find most balanced binate
    variable = cubeList (:, varIndex);
    negated = 0;
    nonNegated = 0;
    for cubeIndex = 1 : length(variable)    
      if (variable(cubeIndex) == 1)
        nonNegated++;
      elseif (variable(cubeIndex)==2)
        negated++;
      endif
    endfor
    balance = negated - nonNegated;
    absValBalance = balance*sign(balance); #absolute value (necessary to find the most balanced binate (balance can be negative))
    if !((negated==0) || (nonNegated ==0)) #add the balance to the list only if variable is binate
      balancesVariables = [balancesVariables; absValBalance];
      if (absValBalance == max (balancesVariables))#check wheiter the variable is the most balanced yet
        mostBalancedVar = varIndex;
      endif
    endif
  endfor
  
  if (length (balancesVariables != 0)) #function is binate
    chosenVar = mostBalancedVar;
    index = chosenVar;
  else #function is unate
    appearencesVar = [];
    potVars = [];
    for varIndex = 1 : length (cubeList(1,:)) #choose the variable that appears in the most cubes
      variable = cubeList (:, varIndex);
      appearences = length (variable);
      for cubeIndex = 1 : length(variable) 
        if (variable (cubeIndex) == 3)
          appearences--;
        endif
      endfor
      appearencesVar = [appearencesVar; appearences];
      if (appearences == max (appearencesVar))
        potVars = [potVars ; appearences varIndex];
      endif
    endfor
    varAppearences = potVars(:,1); #retrieve the appearences 
    chosenVar = potVars(min(find(varAppearences== max (varAppearences))), 2); #chose the first variable that has the biggest number of appearences
  endif    
################## then, compute cofactor of this variable #####################
  for cubeIndex = 1 : length (cubeList (:,1))
    if (cubeList (cubeIndex, chosenVar) == 1)
      cube = cubeList (cubeIndex, :);
      cube (chosenVar) = 3;
      positiveCofactor = [positiveCofactor ; cube];
    elseif (cubeList (cubeIndex, chosenVar) == 2)
      cube = cubeList (cubeIndex, :);
      cube (chosenVar) = 3;
      negativeCofactor = [negativeCofactor ; cube];
    else 
      cube = cubeList (cubeIndex, :);
      cube (chosenVar) = 3;
      negativeCofactor = [negativeCofactor ; cube];
      positiveCofactor = [positiveCofactor ; cube];
    endif
  endfor
 endif

   
endfunction 