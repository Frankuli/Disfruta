var express = require('express')
var path = require('path')
var mysql = require('mysql')
var app = express()
var fileUpload = require('express-fileupload');

var fs = require('fs');
//nuevo manejo de sessiones!
var session = require('express-session')


app.use(fileUpload());

app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, 'views'))
app.set('json', path.join(__dirname, 'public/json'))
app.set('css', path.join(__dirname, 'public/css'))
app.use(express.static("public"));



//uso la session con un secret para el manejo de las cookies
app.use(session({ secret: 'holakease', cookie: { maxAge: 1200000 } }));

var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true }));




//Creo la variable global para el uso de las sessiones!
//esta se puede acceder de las diferentes rutas
var sess;
//Creo la coneccion con la base de datos
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "disfrutar"
})
console.log('creada')
console.log(app.get('json'))

// comienzo de las funciones
function AgregarCarrito(valor, check) {
    id = valor.split('button')[1]
    console.log("el valor es " + id + " checkd " + check);

    console.log(valor);

    var a = document.getElementsByName(valor)

    console.log(a[0].checked);

}


function getExtension(filename) {
    return '.' + filename.split('.').pop();
}



function sqlQuery(datos, tabla, valorPedido, valorBuscado, tipo, promo, filtro) {


    valorPedido = valorPedido || 'nv' //  
    valorBuscado = valorBuscado || 'nv' //  
    tipo = tipo || 'nv' // en el caso que el parametro tenga de valor 'undefined' o null 
    promo = promo || 'nv' // va a tomar el valor que esta despues de || nv = ningun valor
    filtro = filtro || 'nv' //        


    //si ubiese mas de un dato, lo separamos aca...
    var datos = datos.split(".");
    var datosPedidos = "";
    for (var i = 0; i <= datos.length - 1; i++) {
        datosPedidos += datos[i];
        if ((datos.length - i) > 1) {
            datosPedidos += ',';
        }
    }

    //generamos la primer parte de la query
    var query = 'SELECT ' + datosPedidos + ' FROM ' + tabla

    //agrego valorPedido y bucado si lo hubiese

    if (valorPedido != 'nv') {
        query += ' WHERE ' + valorPedido + ' like "%' + valorBuscado + '%"'
    }

    // agrego tipo
    console.log(filtro)

    if (!((tipo != 'nv' && tipo == 'todos') || (tipo != 'todos' && tipo == 'nv'))) {




        if (query.includes('WHERE')) {
            query += ' AND itemtipo = "' + tipo + '"'
        } else {
            query += ' WHERE itemtipo = "' + tipo + '"'
        }

    }

    //agrego promo

    if (promo != 'nv') {

        if (query.includes('WHERE')) {
            query += ' AND promo = "' + promo + '"'
        } else {
            query += ' WHERE promo = "' + promo + '"'
        }

    }

    //agrego filtro
    if (filtro != 'nv') {

        switch (filtro) {
            case "nombre":
                query += ' ORDER BY fruta' + filtro
                break;
            case "precio":
                query += ' ORDER BY fruta' + filtro + ' DESC'
                break;

        }
    }


    return query
}

function sqlInsertArticulo(tabla, columnas, valores) {
    "INSERT INTO customers (name, address) VALUES ('Company Inc', 'Highway 37')"
    return
}

function sqlInsertUsuario(nombre, apellido, direccion, telefono, email, password) {

    return "INSERT INTO usuarios (nombre, apellido,direccion,telefono,email,password) VALUES ('" + nombre + "','" + apellido + "','" + direccion + "','" + telefono + "','" + email + "','" + password + "')"
}









//Final de las funciones

var router = express.Router()
    
router.get('/', function(req, res) {
sess = req.session;
sess.active;
    if (!sess.active) {
            sess.active = false;

    }
        if (!sess.tipo) {
            sess.tipo = 'usr';

    }

    /*
     * Here we have assign the 'session' to 'sess'.
     * Now we can create any number of session variable we want.
     * in PHP we do as $_SESSION['var name'].
     * Here we do like this.
     */

    //render la pagina principal con las frutas de promo
    console.log(sqlQuery('*', 'frutas', req.param('buscar'), req.param('data-id'), req.param('promo'), req.param('filtro')))
    var x = 0
    con.query(('SELECT frutaimg,frutanombre,frutaprecio FROM frutas WHERE promo = 1 limit 6'), function(err, result) {
        if (err) throw err + "acaa";
        res.render('index', {
            frut: result,
            x: x,
            ses: sess
        })
    })
})



router.get('/shop', function(req, res) {
    sess = req.session


    var x = 0 //Variable que me va a servir de contador al momento de mostrar los productos en la pagina
    //itembusqueda = req.param('buscar') || 'nada'; //parametro que sera sacado de la url una vez que se ejecute la busqueda
    console.log(req.param('buscar'))
    //console.log(itembusqueda    )  

    //si el parametro no contiene nada, mostrar todos los productos...
    if (req.params) {
        if (req.param('buscar')) { var dato = "frutanombre" }
        var tipo = null
        if (req.param('tipo') == 0) {
            tipo = "fruta"
        } else if (req.param('tipo') == 1) {
            tipo = "verdura"
        }

        con.query(sqlQuery('*', 'frutas', dato, req.param('buscar'), tipo, req.param('promo'), req.param('filtro')), function(err, result) {

            var json = JSON.stringify(result);

            fs.writeFileSync('public/json/myjsonfile.json', json);
            if (err) throw err + "acaa";
            res.render('shop', {

                frut: result,
                x: x,
                ses: sess

            })
            console.log(sess.nombre);
        })
    }

    //sino, mostrar los productos que coincidan con 'itembusqueda'
    else {
        con.query((sqlQuery('*', 'frutas')), function(err, result) {
            if (err) throw err + "acaa";
            res.render('shop', {
                frut: result,
                x: x,
                ses: sess

            })
            console.log(sess.nombre);
        })

    }

})



router.get('/sesion', function(req, res) {
    res.render('sesion')


})


router.post('/sesion', function(req, res) {
    sess = req.session;
    //In this we are assigning email to sess.email variable.
    //email comes from HTML page.
    if (req.body.email) {
        consulta = 'Select id,email, password,tipo,nombre from usuarios where email = "' + req.body.email + '" and password = "' + req.body.password + '" limit 1'
        con.query(consulta, function(err, result) {
            if (err) throw err + "acaa";
            if (result[0]) {

                sess.userId = result[0].id;
                sess.active = true;
                sess.email = result[0].email;
                sess.tipo = result[0].tipo;
                sess.nombre = result[0].nombre;
                sess.carrito = [];
                res.redirect('/');
                carSes = 'public/json/carrito'+sess.userId+'.json'
                fs.writeFile(carSes, '')

            } else {

                res.render('sesion', { status: "Usuario o contraseña incorrectos" })

            }
        })
    } else if (req.body.regEmail) {
        consulta = 'insert into usuarios (nombre,apellido,direccion,telefono,email,password,tipo) values( "' + req.body.name + '","' + req.body.fullName + '","' + req.body.direccion + '","' + req.body.telefono + '","' + req.body.regEmail + '","' + req.body.password + '","' + 'usr' + '")'
        console.log(consulta);
        con.query(consulta, function(err, result) {
            if (err) throw err;
            res.redirect('sesion')
        })
    }



    console.log('abrio el get')


})


app.get('/logout', function(req, res) {
    req.session.destroy(function(err) {
        if (err) {
            console.log(err);
        } else {
                carSes = 'public/json/carrito'+sess.userId+'.json'
            fs.unlinkSync(carSes);
            res.redirect('/');
        }
    })
})


app.use('/', router)

app.listen(3000, function(err) {
    if (err) {
        console.error(err)
        res.render('index', {
            promo: result

        })
    }
    console.log('serverfuncionando en 3000')
})

router.get('/frutas', function(req, res) {
    sess = req.session
    if (sess.tipo == 'admin') {
        res.render('agregarfruta')
    } else {
        res.send('No tienes permiso para acceder a esta zona!')
    }
})


router.post('/frutas', function(req, res) {

    consulta = 'insert into frutas (frutanombre ,frutaprecio,frutaimg,frutastock,promo,itemtipo) values( "' + req.body.name + '","' + req.body.price + '","' + req.body.name + getExtension(req.files.img.name) + '","' + req.body.cantidad + '","' + req.body.promo + '","' + req.body.tipo + '")'
    con.query(consulta, function(err, response) {
        if (err) throw err;
        if (!req.files)
            return res.status(400).send('No files were uploaded.');

        // The name of the input field (i.e. "sampleFile") is used to retrieve the uploaded file
        let imag = req.files.img;


        // Use the mv() method to place the file somewhere on your server
        imag.mv('public/img/' + req.body.name + getExtension(req.files.img.name), function(err) {
            if (err)
                return res.status(500).send(err);

            res.send('File uploaded!');
        })
    })
})

router.get('/resumen', function(req, res) {
    sess = req.session
    if (!sess.email) {
        res.send("inicie sesion primero!");

    } else {
        res.render('resumen', { ses: sess })
    }
})



router.post('/shop', function(req, res) {
    res.send('hola')


})


app.post('/ReceiveJSON', function(req, res) {
    sess = req.session
    if (!sess.email) {
        res.send("inicie sesion primero!");

    } else {

        var itemCar = {};
        itemCar.userId = sess.userId
        itemCar.id = req.body.id
        itemCar.nombre = req.body.nombre
        itemCar.precio = req.body.precio
        status = req.body.check
        posicion = null

        console.log( itemCar);

        console.log(itemCar + " " + status);
        for (var i = sess.carrito.length - 1; i >= 0; i--) {
            if (sess.carrito[i].id == itemCar.id) {
                posicion = i
            }
        }
        if (status === "true") {

            //if (!sess.carrito.includes(itemCar)){
            if (posicion == null) {
                sess.carrito.push(itemCar)
                console.log("agregamos: " + itemCar.nombre);
                console.log("el carrito ahora contiene: " + sess.carrito);
                var json = JSON.stringify(sess.carrito);
                                        carSes = 'public/json/carrito'+sess.userId+'.json'

                fs.writeFile(carSes, json);

            }
        } else if (status === "false") {
            console.log("entro al else...");
            if (posicion != null) {
                                console.log("sacamos " + itemCar.nombre);

                sess.carrito.splice(posicion, 1);
                console.log("el carrito ahora contiene: " + sess.carrito);
                var json = JSON.stringify(sess.carrito);
                        carSes = 'public/json/carrito'+sess.userId+'.json'

                fs.writeFile(carSes, json);


            }
        }
        res.send("ok");
    }


});

router.post('/comment', function(req, res) {
    var sendComment = require('./controllers/comment.js');
    if (sendComment.addComment(req.body, con)) {
        res.end();
        res.redirect('/commentOk');
    } else {
        res.send("algo salio mal...")
    }
})

router.get('/commentOk', function(req, res) {
    res.render('commentOk')
})

router.post('/checkout', function(req, res) {
    var sendTicket = require('./controllers/ticket.js');
    ventaId = sendTicket.addTicket(sess, con, req.body)
    console.log("ticket id:" + ventaId);
    console.log(req.body);

        consulta =  'forma_pago.desc_form_pago as `fPago`,\
                    SUM(item_cant*item_prec)  as `suma`,\
                    usuarios.nombre,usuarios.apellido,usuarios.direccion,usuarios.telefono,usuarios.email, usuarios.id \
                    venta.fech_vent \
                    from detalle_venta \
                    INNER JOIN venta on venta.id_vent = detalle_venta.id_vent\
                    INNER JOIN usuarios on venta.id_clie = usuarios.id \
                    INNER JOIN forma_pago on forma_pago.id_form_pago = venta.id_form_pago\
                    where detaid =  '+ 112 +'\
                    GROUP BY detaid'
    res.end();
    res.redirect('/factura');



})
router.get('/ventaOk', function(req, res) {
    res.render('ventaOk')
})



router.get('/adminpanel', function(req, res) {
    var estados;

    //if (sess.tipo === 'admin') {
    function esta(req, res) {
        con.query('SELECT * FROM estado_venta', function(err, res) {
            if (err) {
                throw err;
            } else {
                estados = res;
            }
        })
    }
    esta();
    consulta = 'SELECT venta.fech_vent as `fecha`,\
                    detalle_venta.id_vent as `detaid`,\
                    forma_pago.desc_form_pago as `fPago`,\
                    SUM(item_cant*item_prec)  as `suma`,\
                    usuarios.nombre,usuarios.apellido,usuarios.direccion, \
                    estado_venta.desc_esta\
                    from detalle_venta \
                    INNER JOIN venta on venta.id_vent = detalle_venta.id_vent\
                    INNER JOIN estado_venta on venta.esta_vent = estado_venta.id_esta\
                    INNER JOIN usuarios on venta.id_clie = usuarios.id \
                    INNER JOIN forma_pago on forma_pago.id_form_pago = venta.id_form_pago\
                    GROUP BY detaid ORDER by fecha ASC' 
    con.query(consulta, function(err, result) {
        if (err) throw err + "acaa";
        if (result) {

            res.render('admin', {
                ventas: result,
                estados: estados,
                ses: sess

            })

        }
    })
    //} else {
    //  res.send('error')
    //}
})

router.get('/detalleventa', function(req, res) {
    //if (sess.tipo === 'admin') {
            if ('admin' === 'admin') {

        consulta = 'SELECT frutas.frutanombre as `nombre`,\
                detalle_venta.item_prec as `precio`,\
                detalle_venta.item_cant as `cantidad`\
                FROM detalle_venta\
                INNER JOIN frutas on detalle_venta.id_arti = frutas.id \
                WHERE detalle_venta.id_vent =' + req.param('id');
        con.query(consulta, function(err, result) {
            if (err) throw err + "acaa";
            if (result) {

                res.render('detalleventa', {
                    items: result,
                    ses: sess

                })

            }
        })
    } else {
        res.send('error')
    }
})

router.get('/comentario', function(req, res) {
    if (typeof sess !== 'undefined') {
        if (sess.tipo === 'admin'){
        consulta = 'SELECT * FROM comentario'
        con.query(consulta, function(err, result) {
            if (err) throw err + "acaa";
            if (result) {

                res.render('comments', {
                    comentario: result,
                    ses: sess

                })

            }
        })}
    } else {
        res.send('error')
    }
})

app.post('/cambiarestado', function(req, res) {
    sess = req.session
    if (false) {
        res.send("inicie sesion primero!");

    } else {
        if (true) {
            console.log(req.body.ventaId);
            console.log(req.body.estadoId);
            cambEstado = "update venta set esta_vent = " + req.body.estadoId + "where id_vent = " + req.body.ventaId;
            console.log(cambEstado);
            con.query(cambEstado, function(err, result) {
                if (err) throw err + "acaa";
                if (result) {
                    //codigo si esta todo ok
                }
            })
            res.end();
        } else {
            res.send('No tienes permisos para entrar aca!')
        }
    }
})

router.get('/adminpanel/ventas',function (req,res) {
    var estados;

    //if (sess.tipo === 'admin') {
    function esta(req, res) {
        con.query('SELECT * FROM estado_venta', function(err, res) {
            if (err) {
                throw err;
            } else {
                estados = res;
            }
        })
    }
    esta();
    consulta = 'SELECT detalle_venta.id_vent as `detaid`,\
                            forma_pago.desc_form_pago as `fPago`,\
                    SUM(item_cant*item_prec)  as `suma`,\
                    usuarios.nombre,usuarios.apellido,usuarios.direccion, \
                    estado_venta.desc_esta\
                    from detalle_venta \
                    INNER JOIN venta on venta.id_vent = detalle_venta.id_vent\
                    INNER JOIN estado_venta on venta.esta_vent = estado_venta.id_esta\
                    INNER JOIN usuarios on venta.id_clie = usuarios.id \
                    INNER JOIN forma_pago on forma_pago.id_form_pago = venta.id_form_pago\
                    GROUP BY detaid'
    con.query(consulta, function(err, result) {
        if (err) throw err + "acaa";
        if (result) {

            res.send({
                ventas: result,
                estados: estados,
                ses: sess

            })

        }
    })

})

router.get('/detallecomentario', function(req, res) {
    if (sess.tipo === 'admin') {
        consulta = 'SELECT * FROM comentario where id_come ="'+req.param('id')+'"';
        con.query(consulta, function(err, result) {
            if (err) throw err + "acaa";
            if (result) {

                res.render('comentario', {
                    comentario: result,
                    ses: sess

                })

            }
        })
    } else {
        res.send('error')
    }
})

app.use(function (err, req, res, next) {
  console.error(err.stack)
  res.status(500).send('Something broke!')
})

router.get('/factura', function(req, res) {

    res.render('factura')
})