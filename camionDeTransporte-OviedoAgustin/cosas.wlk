object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    method peso() = 800
    var estado = robot
    method peligrosidad() = estado.peligrosidad()
    method transformar(unEstado){
        estado = unEstado
    }

    //var estaRobot = false
    //method peligrosidad(){
    //    if (estaRobot)
    //        return 30
    //    else
    //        return 15
    //}
    //method peligrosidad() = if (estaRobot) 30 else 15

    //method transformar(){
    //    estaRobot = not estaRobot
    //}
}

object auto {
  method peligrosidad() = 15
}

object robot {
  method peligrosidad() = 30
}

object ladrillos {
  var property cantidad = 0
  method peso() = 2 * cantidad
  method peligrosidad() = 2
}

object arena {
  method peligrosidad() = 1
  var property peso = 0 
}

object bateria {
  var estaCargada = false
  method peso() = if (estaCargada) 300 else 200
  method peligrosidad() = if (estaCargada) 100 else 0
  method cargar(){
    estaCargada = true
  }
  method descargar(){
    estaCargada = false
  }
}

object contenedor {
  const cosas = []
  method agregarCosa(unaCosa){
    cosas.add(unaCosa)
  }
  method peso(){
    return 100 + cosas.sum({c => c.peso()})
  }

  method peligrosidad(){
    if (cosas.isEmpty()) return 0
    return cosas.max({c => c.peligrosidad()}).peligrosidad()
  }
}

object residuos {
  method peligrosidad() = 200

  var property peso = 0 
}

object embalaje {
  var property cosaEnvuelta = cosaNulleable
  method peso() = cosaEnvuelta.peso()
  method peligrosidad() = cosaEnvuelta.peligrosidad() * 0.5
}

object cosaNulleable {
  method peso() = 0
  method peligrosidad() = 0
}