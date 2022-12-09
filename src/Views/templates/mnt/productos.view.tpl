<section class="depth-1">
<h1>Trabajar con Productos</h1>
</section>

<section class="WWList">
  <table>
    <thead>
      <tr>
        <th>Id</th>
        <th>Nombre</th>
        <th>Categoria</th>
        <th>Precio</th>
        <th>Disponibles</th>
        <th>Código de Barras</th>
        <th>Imagen</th>
        <th><a href="index.php?page=Mnt-producto&mode=INS">
        <i class="fas fa-plus"></i>
      </a></th>
      </tr>
    </thead>
    <tbody>
      {{foreach Productos}}
      <tr>
        <td>{{productId}}</td>
        <td> <a href="index.php?page=Mnt-producto&mode=DSP&id={{productId}}">{{productname}}</a></td>
        <td>{{catid}}</td>
        <td>{{productprice}}</td>
        <td>{{stock}}</td>
        <td>{{productCodInt}}</td>
        <td>{{proimg}}</td>
        <td>
          <a href="index.php?page=Mnt-producto&mode=UPD&id={{productId}}">
          <i class="fas fa-edit"></i></a>

          &NonBreakingSpace;
          <a href="index.php?page=Mnt-producto&mode=DEL&id={{productId}}">
          <i class="fas fa-trash"></i></a>
        </td>
      </tr>
      {{endfor Productos}}
    </tbody>
  </table>
</section>




