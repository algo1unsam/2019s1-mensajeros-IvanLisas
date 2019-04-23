import paquete.*
import destinos.*
import transportes.*

object mensajeria {
	
	var mensajeros = #{}

	method mensajeros()= mensajeros	
	
	method contratar(alguien) {
		mensajeros.add(alguien)
	}
	
	method despedir(alguien){
		mensajeros.remove(alguien)
	}
	
	method despedirAtodos(){
		mensajeros.removeAll()
	}
	
	method esGrande(){
		return mensajeros.size()>=2
	}
}

object roberto {
	
	var property transporte = null
	
	method peso() = 90 + transporte.peso()
	
	method puedeLlamar() = false
	
}

object chuckNorris {
	
	method peso() = 900
	
	method puedeLlamar() = true
	
}

object neo {
	
	var property tieneCredito = false
	
	method peso() = 0
	
	method puedeLlamar() = self.tieneCredito()

}