package user

import groovy.transform.ToString
import groovy.transform.TupleConstructor

@TupleConstructor
@ToString(includeNames = true)
class ZombieIcon {
    String path
    String markerPath
}