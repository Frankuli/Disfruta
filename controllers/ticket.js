module.exports = {

    addTicket: function(sess, con, body) {

        console.log("----------------------------------------------");
        var ventaId;

        date = new Date();
        console.log(sess.userID);
        console.log(body);
        commentDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds()
        consulta = 'insert into venta (fech_vent ,id_clie,id_form_pago,id_envi,esta_vent) values( "' + commentDate + '","' + sess.userId + '","' + body.pago + '","' + body.envio +'","' + 1 + '")'
        console.log(consulta);
        con.query(consulta, function(err, response) {
            if (err) throw err;
            ventaId = response.insertId
            console.log("ticket insertid: " + response.insertId);

            for (var i = sess.carrito.length - 1; i >= 0; i--) {
                consultaDeta = 'insert into detalle_venta (id_vent, id_arti, item_cant,item_prec) values( "' + response.insertId + '","' + sess.carrito[i].id + '","' + body.cant[i] + '","' + sess.carrito[i].precio + '")'
                console.log(consultaDeta);
                con.query(consultaDeta, function(err, response) {
                    if (err) throw err;
                })

            }

        })
        return ventaId;
    }
    }
