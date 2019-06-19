import 'API.dart';

class Sources {

    static Map _sources;

    static fetchSources() async {
        _sources = await API.getSources();
    }

    static fromId(String id) {
        if(_sources.containsKey(id))
            return _sources[id];
        else
            return id;
    }

}