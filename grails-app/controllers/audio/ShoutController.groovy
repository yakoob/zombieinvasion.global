package audio

import city.CityController
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile
import region.City

class ShoutController {

    def index(){
        def cities = City.findAllByPopulation(1000)
        println(cities.size())
        cities.each {
            println(it)

            def random = new Random()
            def randomInt = random.nextInt(1000-200+1)+200
            it.population = randomInt
            println it.population
            it.save(failOnError: true, flush: true)

        }
        render "audio binary controller"
    }

    @Transactional(readOnly = true)
    def shout() {

        try {
            def id = params?.id?:378
            def audioBinary = AudioBinary.findById(id)
            log.debug(audioBinary.uuid)
            response.contentType = 'application/octet-stream'
            response.setHeader('Content-disposition', "attachment; filename=$id")
            response.outputStream << new ByteArrayInputStream(audioBinary.fileBinary)?.bytes
            response.outputStream.flush()
            return
        } catch (e) {
            render e.message
            render "Error Streaming audio...."
        }
    }

    @Transactional(readOnly = false)
    def createAudio(request){
        MultipartFile f = request.getFile('audioFile')
        return new AudioBinary(uuid: UUID.randomUUID().toString(), fileBinary: f.inputStream.bytes).save(failOnError: true)
    }


}


