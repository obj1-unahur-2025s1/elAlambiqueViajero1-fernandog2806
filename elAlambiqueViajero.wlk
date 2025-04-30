// elAlambiqueViajero.wlk


    object luke {
    var vehiculo = alambiqueVeloz
    var lugarVisitado = null
    const property recuerdos = []
    var recuerdoActual = "recuerdo de paris"

    method vehiculo() = vehiculo
    
    method nuevoVehiculo(otroVehiculo) {
        vehiculo = otroVehiculo
    }
    
    method lugaresVisitados() = lugarVisitado
    
    method nuevoLugar(nuevoLugar) {
        lugarVisitado = nuevoLugar
    }
    
    method recuerdoActual() = recuerdoActual
    
    method recuerdoActual(nuevoRecuerdo) {
        recuerdoActual = nuevoRecuerdo
    }

    method traerRecuerdoTipico(recuerdoDeUnLugar) {
        recuerdoActual = recuerdoDeUnLugar
    }

    method puedeViajarAlDestinoConElVehiculo(destino, unVehiculo) {
        if (destino == "Buenos Aires") {
            return unVehiculo.esRapido()
        } else if (destino == "Bagdad") {
            return true  
        } else if (destino == "París") {
            return destino.distancia() <= unVehiculo.combustible() 
        } else {
            return false 
        }
    }
    }

    object buenosAires {
    method distancia() = 200  
    }

    object paris {
    method distancia() = 100  
    }

    object bagdad {
    method distancia() = 300 
    }

    object lasVegas {
    method distancia() = 250 
    }

    object recuerdosDeParis {
    method obtenerRecuerdo() = {recuerdo => recuerdo.llaveroTorreEiffel()}
    }

    object recuerdosDeBuenosAires {
        const esPresidenteCopado = true
        method obtenerRecuerdo() {
            if (esPresidenteCopado){
                return {recuerdo => recuerdo.mateConYerba()}
                } else{
                    return {recuerdo => recuerdo.mateSinYerba()}
            }
        }
    }

    object recuerdosDeBagdad {
        const recuerdosPosibles = [bidonDePetroleo, armas, jardinesColgantes, aleatorio]
        method obtenerRecuerdo() {
        return recuerdosPosibles.anyOne()
    }
    }

    object bidonDePetroleo {
        method descripcionRecuerdos() {
        return "Bidon de Petroleo "
        }
    }
    object armas {
        method descripcionRecuerdos() {
        return "Armas de destrucción masivas"
        }
    }
    object jardinesColgantes {
        method descripcionRecuerdos() {
        return "Jardines colgantes de Babilonia"
        }
    }
    object aleatorio {
        method descripcionRecuerdos() {
        return "Otro recuerdo aleatorio"
        }
    }

    object recuerdoDeLasVegas {
    var lugarDeHomenaje = null
    method establecerLugarDeHomenaje(lugar) {
        lugarDeHomenaje = lugar
    } 
    method obtenerRecuerdo() {
        if (lugarDeHomenaje == "buenosAires"){
            return recuerdosDeBuenosAires.obtenerRecuerdo()
        }else if (lugarDeHomenaje == "Bagdad") {
            return recuerdosDeBagdad.obtenerRecuerdo()
        }else if (lugarDeHomenaje == "París"){
            return recuerdosDeParis.obtenerRecuerdo()
        }else
            return null
    }
    }


    object alambiqueVeloz {
    var cantidadDeCombustible = 10
    var velocidad = 100
    
    method combustible() = cantidadDeCombustible
    
    method velocidadActual() = velocidad
    
    method velocidadActualizada(nuevaVelocidad) {
        velocidad = nuevaVelocidad
    }
    
    method agregarCombustible(combustible) {
        cantidadDeCombustible += combustible
    }
    
    method sacarCombustible(combustible) {
        cantidadDeCombustible = (cantidadDeCombustible - combustible).max(0)
    }
    
    method esRapido() = velocidad >= 100
    }


    object estadosUnidos {
    method restriccionesDelVehiculo(vehiculo) =
        vehiculo.esRapido() && vehiculo.combustible() >= 20
    }


    object superChatarraEspecial {
    var cantidadDeCombustible = 150
    var velocidad = 80
    
    var vida = 200
    method vidaActual() = vida
    method vidaActualizada(arma) {
        vida = (vida - arma.daño()).max(0)
    }
    method combustible() = cantidadDeCombustible
    
    method velocidadActual() = velocidad
    
    method velocidadActualizada(nuevaVelocidad) {
        velocidad = nuevaVelocidad
    }
    
    method agregarCombustible(combustible) {
        cantidadDeCombustible += combustible
    }
    
    method sacarCombustible(combustible) {
        cantidadDeCombustible = (cantidadDeCombustible - combustible).max(0)
    }
    
    method esRapido() = velocidad >= 100

    }


    object cañon {
        var municiones = 500
        method municiones() = municiones
        method municionesRestantes(municionesUsadas) {
        municiones = (municiones- municionesUsadas).max(0)
        }
        method daño() = 100
    }

    object ametralladora {
        var municiones = 300
        method municiones() = municiones
        method municionesRestantes(municionesUsadas) {
        municiones = (municiones - municionesUsadas - 20).max(20)
        }
        method daño() = 75
    }

    object escopeta {
        var municiones = 300
        method municiones() = municiones
        method municionesRestantes(municionesUsadas) {
        municiones = (municiones - municionesUsadas - municiones/5).max(0)
        }
        method daño() = 75
    }

