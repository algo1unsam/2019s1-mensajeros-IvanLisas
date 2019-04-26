import paquete.*
import destinos.*
import transportes.*

object mensajeria {
	
	var mensajeros =[]

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
	
	method puedeEntregar(paquete){
		return paquete.estaPago() && paquete.destino().puedeEntrar(mensajeros.first())
	}
	
	method pesoDelUltimo(){
		return mensajeros.last().peso()
	}
	
	method puedeSerEntregado(paquete){
			return mensajeros.any({ mensajero =>  paquete.destino().puedeEntrar(mensajero) })
	}
	
	method paqueteFacil(paquete){
			return mensajeros.all({ mensajero =>  paquete.destino().puedeEntrar(mensajero) })
	}
	
	method candidatos(paquete){
			return mensajeros.filter({ mensajero =>  paquete.destino().puedeEntrar(mensajero) })
	}
	
	method sobrePeso(){
		 return mensajeros.sum { mensajero => mensajero.peso() } > 500
	}
	
	method entregarPaquete(paquete){
		if(self.puedeSerEntregado(paquete) && paquete.estaPago()) paquete.entregar(self.candidatos(paquete).anyOne())
			else error.throwWithMessage("No se puede entregar")
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