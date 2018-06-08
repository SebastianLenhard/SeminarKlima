#
# a3.m -- Loesung der 
#
# (c) 2018 Prof Dr Andreas Müller
#
N = 1003;
l = 200;
a = zeros(1,N+1);
a(1) = 1;
a(2) = -2;
a(3) = -2*a(2)/2^2;
for k = (4:N+1)
	a(k)=-(2*a(k-1) + (k-3)^2*a(k-2))/((k-1)^2);
end
format long
a'
a + shift(a, 2);

x = 2 * pi * (-l:l)/l;
f = zeros(1,2 * l + 1);

for j = 0:N
	f = f + a(j+1) * cos(j * x);
end

fd = fopen("a3.path", "w");
fprintf(fd, "\\draw[color=red,line width=1.4pt] (%.3f,%.3f)\n", x(1), f(1));
for i = (2:2*l+1)
	fprintf(fd, "--(%.3f,%.3f)\n", x(i), f(i));
end
fprintf(fd, ";");
fclose(fd);

