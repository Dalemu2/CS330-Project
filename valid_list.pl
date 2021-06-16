/*Daniel Alemu
CS330 section 002*/ 

/*facts*/
package(p1).
package(p2).
package(p3).
package(p4).


depends(p1,p2).
depends(p2,p3).
depends(c,b).
% is the name of a package which is available on the system.

valid_list([Head|Tail]):- 
	package(Head),		%check the head
    	valid_list(Tail).		%check the tail
    	valid_list([]).		%base case/empty list

% 2.  unsatisfied_dependency(P,L) Returns true when P is a dependency of some member of L, 
%  but P is not a member of L itself.*/


list_member(X, [X|_Tail]).	% helper predicate list_member  checks the given value if it exist in the list
	list_member(X, [_Head|Tail]):- 
	list_member(X,Tail).

not_member(P,L):-			%helper predicate check P in the member of list using helper predicate list member	
	list_member(P,L),!,fail.	%change the output if it's true to false or vice vers
	not_member(_,_).

unsatisfied_dependency(P,L):- 		%
	list_member(X,L),
	not_member(P,L),
	depends(P,X). 

%3.  unsatisfied_dependency(L) 
%Returns true when any member of L has an unsatisfied dependency. 

unsatisfied_dependency(L):- depends(Y,X),list_member(X,L),not_member(Y,L).


% 4.  dependency_check(L) 
% Returns true when  depends(Y,X).
% L has no unsatisfied dependencies.


dependency_check(L):- unsatisfied_dependency(L),!,fail.	%return true if L has no unsatisfied dependency 
	dependency_check(_).

%  5. ext_depends(P1,P2)        
%  Returns true when P1 depends on package P2, 
%   either directly or inderectly by some sequence of of dependencies. 

%check dependens directly or indirectly 
ext_depends(X,Y):- 
		depends(X,Y).		
	ext_depends(X,Y):- 
		depends(X,Z), 
	ext_depends(Z,Y).
