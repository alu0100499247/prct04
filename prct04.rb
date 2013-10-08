#!/usr/bin/env ruby

class Matrices
	def mapmap(a)
		a.map { |r|
			r.map { |e|
				yield e
			}
		}
	end

	def to_m(a)
		a = a.split(/\n/)
		a = a.map { |r| r.split(/\s+/) }
		a = mapmap(a) { |x| x.to_f }
	end

	def read_matrices(fn)
		text = File.open(fn).read

		a, b = text.split(/\n\n+/)	
		a = to_m(a)
		b = to_m(b)

		[a, b]
	end

	def producto(a,b)
		n = a.length
		c = Array.new(n) {Array.new(n,0)}

		for i in (0...n)
			for j in (0...n)
				for k in (0...n)
					c[i][j] += a[i][k] * b[k][j]
				end
			end
		end
		c
	end

	def suma(a,b)
		d = a.dup
		for i in (0...a.length)
			for j in (0...a[0].length)
				d[i][j] = a[i][j] + b[i][j]
			end
		end
		d
	end

	def mostrar(a)
		cad = String.new
		for i in (0...a.length)
			cad << "["
			for j in (0...a[0].length)
				cad << " #{a[i][j]} "
			end
			cad << "]"
			cad << "\n"
		end
		cad
	end
end

if __FILE__ == $0
	mx = Matrices.new

	a, b = mx.read_matrices('datos.dat')

	puts mx.mostrar(a)
	puts ""
	puts mx.mostrar(b)
	
	puts "El producto es: \n"
	if a[0].length == b.length	# Producto
		puts mx.mostrar(mx.producto(a,b))	
	else
		puts "Imposible hallar el producto de estas dos matrices! :("
	end

	puts ""

	puts "La suma es: \n"
	if a[0].length == b.length	# Suma
		puts mx.mostrar(mx.suma(a,b))	
	else
		puts "Imposible hallar la suma de estas dos matrices! :("
	end
	
end
