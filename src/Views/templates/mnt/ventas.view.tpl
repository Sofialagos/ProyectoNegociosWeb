<section class="depth-1">
  <h1>Trabajar con Ventas</h1>
  </section>
  <section class="WWList">
    <table>
      <thead>
        <tr>
          <th>Id</th>
          <th>Fecha</th>
          <th>Producto</th>
          <th>Monto</th>

        </tr>
      </thead>
      <tbody>
       
        {{foreach ventas}}
        <tr>
          <td><a href="index.php?page=mnt-venta&mode=DSP&id={{Ventaid}}">{{Ventaid}}</a></td>

          <td>{{Ventaid}}</td>
          <td>{{fechaventa}}</td>
          <td>{{productoVendido}}</td>
          <td>{{monto}}</td>
          <td>

            <a href="index.php?page=mnt-venta&mode=UPD&id={{Ventaid}}">Editar</a>
            &NonBreakingSpace;
            <a href="index.php?page=mnt-venta&mode=DEL&id={{Ventaid}}">Eliminar</a>
          </td>
        </tr>
        {{foreach ventas}}

      </tbody>
    </table>
  </section>