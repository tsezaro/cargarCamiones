object knightRider{
	method peso() = 500
	
	method cargando(){}
	
	method bulto() = 1
	
	method peligrosidad() = 10
}


object bumblebee{
	var forma = "auto"
	
	method peso() = 800
	
	method peligrosidad(){
		if(forma == "auto"){
			return 15
		}
		else{
			return 30
		}
	}
	
	method cargando(){
		forma = "robot" 
	}
	
	method bulto() = 2
	
}


object paqueteLadrillos{
	
	var property cantidad = 0
	
	method peso() = 2 * cantidad
		
	method peligrosidad() = 2
	
	method cargando(){
		cantidad += 12
	}
	
	method bulto(){
		if(self.peso() <100 and self.peso() >0){
			return 1
		}
		if(self.peso() >100 and self.peso() <301){
			return 2
		}
		if(self.peso() >301){
			return 3
		}
		else{
			return 0
		}
	}
}


object arenaGranel{
	var property peso = 0
	
	method peligrosidad() = 1
	
	method cargando(){
		peso += 20
	}
	
	method bulto() = 1
}


object bateriaAntiAerea{
	var cargaMisiles
	
	method peso(){
		if(cargaMisiles != "yes"){
			return 200
		}
		else{
			return 300
		}
	}
	
	method peligrosidad(){
		if(cargaMisiles != "yes"){
			return 0
		}
		else{
			return 100
		}
	}
	
	method cargando(){
		cargaMisiles = "yes"
	}
	
	method bulto(){
		if(cargaMisiles != "yes"){
			return 1
		}
		else{
			return 2
		}
	}
}



object contenedorPortuario{
	
	var cosas = []
	
	method peso() = 100 + cosas.sum({ cosa => cosa.peso()})
	
	method peligrosidad() = cosas.map({cosa => cosa.peligrosidad()}).maxIfEmpty({0})
	
	method cargando(){
		cosas.forEach({ cosa => cosa.cargando()})
	}
	
	method cargandoContenedor(cosa){
		cosas.add(cosa)
	}
	
	method bulto() = 1 + cosas.sum({ cosa => cosa.bulto()})
}


object residuosRadioactivos{
	
	var property peso = 0
	
	method peligrosidad() = 200
	
	method cargando(){
		peso += 15
	}
	
	method bulto() = 1
	
}

object embalajeDeSeguridad{
	var cosaEmbalada 
	
	method embalaje(unaCosa){
		
		cosaEmbalada = unaCosa
	} 
	
	method peso() = cosaEmbalada.peso()
	
	method peligrosidad() = cosaEmbalada.peligrosidad()/2
	
	method cargando(){
	}
	
	method bulto() = 2
	
}