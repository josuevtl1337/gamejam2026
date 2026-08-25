// carga el chart de un nivel desde un archivo incluido en el proyecto
// (ver los archivos incluidos del proyecto / carpeta datafiles). separa los datos de la
// cancion (que van a ir sumando un archivo por nivel) del codigo que los
// reproduce, que sigue viviendo en obj_game.

function chart_load(_filename)
{
    var _buffer = buffer_load(_filename);
    var _json = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);

    return json_parse(_json);
}
