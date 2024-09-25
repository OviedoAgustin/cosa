import cosas.*


object camion {
    const cosas = []

    method cargar(unaCosa){
        cosas.add(unaCosa)
    }

    method descargar(unaCosa){
        cosas.remove(unaCosa)
    }

    method peso(){
        return 1000 + cosas.sum({c => c.peso()})
    }

    method sonNumerosImpares(){
        return not cosas.any({c => c.peso().even()})
        //return cosas.all({c => c.peso().odd()})
    }

    method cosaQuePesa(unPeso){
        return cosas.any({c => c.peso() == unPeso})
    }

    method cosaQuePesa2(unPeso){
        return not cosas.all({c => c.peso() == unPeso})
    }

    method nivelPeligrosidad(unNivelPeligrosidad){
        return cosas.find({c => c.peligrosidad() == unNivelPeligrosidad})
    }

    method cosasQueSuperan(unNivelPeligrosidad){
        return cosas.filter({c => c.peligrosidad() > unNivelPeligrosidad})
    }

    method cosasQueSuperanA(unaCosa){
        return self.cosasQueSuperan(unaCosa.peligrosidad())
    }

    method estaExcedido(){
        return self.peso() > 2500
    }

    method puedeCircular(unNivelPeligrosidad){
        return not self.estaExcedido() 
        and self.todasSonMenosPeligrosas(unNivelPeligrosidad)
    }

    method todasSonMenosPeligrosas(unNivelPeligrosidad){
        return cosas.all({c => c.peligrosidad()< unNivelPeligrosidad})
    }
}   