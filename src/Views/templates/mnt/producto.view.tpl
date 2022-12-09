<h1>{{mode_desc}}</h1>
<section>
  <form action="index.php?page=mnt_producto" method="post" enctype="multipart/form-data">
    
    <input type="hidden" name="mode" value="{{mode}}" />
    <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
    <input type="hidden" name="productId" value="{{productId}}" />
    
  
    <fieldset>
      <label for="productname">Nombre producto</label>
      <input {{if readonly}}readonly{{endif readonly}} type="text" id="productname" name="productname" placeholder="Descripción" value="{{productname}}" />
      {{if error_productname}}
          {{foreach error_productname}}
            <div class="error">{{this}}</div>
          {{endfor error_productname}}
      {{endif error_productname}}
    </fieldset>
  
    <fieldset>
      <label for="catid">Categoria</label>
      <select name="catid" id="catid" {{if readonly}}readonly disabled{{endif readonly}}>
        {{foreach catidArr}}
          <option value="{{value}}" {{selected}}>{{text}}</option>
        {{endfor catidArr}}
      </select>
    </fieldset>

    

    <fieldset>
      <label for="productprice">Precio</label>
      <input {{if readonly}}readonly{{endif readonly}} type="text" id="productprice" name="productprice" placeholder="Precio" value="{{productprice}}" />
      {{if error_productprice}}
          {{foreach error_productprice}}
            <div class="error">{{this}}</div>
          {{endfor error_productprice}}
      {{endif error_productprice}}
    </fieldset>

    <fieldset>
      <label for="stock">Producto en stock</label>
      <input {{if readonly}}readonly{{endif readonly}} type="text" id="stock" name="stock" placeholder="stock" value="{{stock}}" />
      {{if error_stock}}
          {{foreach error_stock}}
            <div class="error">{{this}}</div>
          {{endfor error_stock}}
      {{endif error_stock}}
    </fieldset>

    <fieldset>
      <label for="productCodInt">Codigo de Barras</label>
      <input {{if readonly}}readonly{{endif readonly}} type="text" id="productCodInt" name="productCodInt" placeholder="Código de Barra" value="{{productCodInt}}" />
      {{if error_productCodInt}}
          {{foreach error_productCodInt}}
            <div class="error">{{this}}</div>
          {{endfor error_productCodInt}}
      {{endif error_productCodInt}}
    </fieldset>

    <fieldset>
      <label for="proimg">Imagen</label>
      <input {{if readonly}}readonly{{endif readonly}} type="file" id="proimg" name="proimg" placeholder="Imagen" value="{{proimg}}" />
      {{if error_proimg}}
          {{foreach error_proimg}}
            <div class="error">{{this}}</div>
          {{endfor error_proimg}}
      {{endif error_proimg}}
    </fieldset>

  
  
    <fieldset>
      {{if showBtn}}
        <button type="submit" name="btnEnviar">{{btnEnviarText}}</button>
        &nbsp;
      {{endif showBtn}}
      <button name="btnCancelar" id="btnCancelar">Cancelar</button>
    </fieldset>
  </form>
</section>

<script>
  document.addEventListener('DOMContentLoaded', function(){
    document.getElementById('btnCancelar').addEventListener('click', function(e){
      e.preventDefault();
      e.stopPropagation();
      window.location.href = 'index.php?page=mnt_productos';
    });
  });
</script>
