#
# a3.m -- Loesung der 
#
# (c) 2018 Prof Dr Andreas Müller
#
a = zeros(1,20);
a(1) = 1
a(2) = -2
a(3) = -2*a(2)/2^2
for k = (4:20)
	a(k)=-(2*a(k-1) + a(k-2))/((k-1)^2)
end
format long
a'

