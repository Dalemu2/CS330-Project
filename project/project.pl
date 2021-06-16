package(p1).
package(p2).
package(p3).
package(p4).
package(p5).
package(p6).

     
valid_list([Head|Tail]):- 
    package(Head),
    valid_list(Tail).
    valid_list([]).
	
