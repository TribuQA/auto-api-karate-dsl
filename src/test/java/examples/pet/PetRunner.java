package examples.pet;

import com.intuit.karate.junit5.Karate;

public class PetRunner {

    @Karate.Test
    Karate testPostEscenarioSimple() {
        return Karate.run("post-escenario-simple").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPostEscenarioOutline() {
        return Karate.run("post-escenario-outline").relativeTo(getClass());
    }

    @Karate.Test
    Karate testGetEscenarioSimple() {
        return Karate.run("get-escenario-simple").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPutEscenarioSimple() {
        return Karate.run("put-escenario-simple").relativeTo(getClass());
    }

    @Karate.Test
    Karate testDeleteEscenarioSimple() {
        return Karate.run("delete-escenario-simple").relativeTo(getClass());
    }

    @Karate.Test
    Karate testNegativoEscenarioSimple() {
        return Karate.run("get-escenario-negativo").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPostEscenarioCustom() {
        return Karate.run("post-escenario-custom").relativeTo(getClass());
    }

}
