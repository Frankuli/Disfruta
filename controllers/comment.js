module.exports = {
    addComment : function(body, con) {
        date = new Date();
                commentDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds()

        consulta = 'insert into comentario (nomb_come ,mail_come ,asun_come,mens_come,fech_come) \
         values( "' + body.nombre + '","' + body.mail + '","' + 
         body.asunto + '","' +body.mensaje + '","' +commentDate + '")'
        return con.query(consulta, function(err, response) {
            if (err) throw err;
        })
    }
}