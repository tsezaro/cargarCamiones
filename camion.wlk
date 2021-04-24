import cosas.*

object camion{
	var contenidos = [] 
	
	method peso() = 1000 
	
	
	method cargar(cosa){
		contenidos.add(cosa)
		cosa.cargando()
	}
	
	method descargar(cosa){
		contenidos.remove(cosa)
	}	
	
	method todoPesoPar() = contenidos.all({ cosa => cosa.peso()%2==0}) //.even()
	

	method elDeNivel(nivel) = contenidos.find({ cosa => cosa.peligrosidad() == nivel})

		
	method pesoTotal() = self.peso() + contenidos.sum({ cosa => cosa.peso()})
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method objetosQueSuperanPeligrosidad(nivel){
		return contenidos.filter({ cosa => cosa.peligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(cosa){
		return contenidos.filter({ cosaa => cosaa.peligrosidad() > cosa.peligrosidad()})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = not self.excedidoDePeso() && 
		contenidos.all({ cosa => cosa.peligrosidad() < nivelMaximoPeligrosidad }) 
	
	
	method tieneAlgoQuePesaEntre(min, max){
		return contenidos.any({ cosa => cosa.peso() > min && cosa.peso() < max })
	}


	method cosaMasPesada(){
		return contenidos.max({ cosa => cosa.peso()})
	}	
	
	method pesos(){
		return contenidos.map({ cosa => cosa.peso()})
	}
	
	method totalBultos() = contenidos.sum({ cosa => cosa.bulto()})
}