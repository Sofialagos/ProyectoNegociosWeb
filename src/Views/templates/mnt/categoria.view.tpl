<h1>{{mode_desc}}</h1>
<section>
  <form action="index.php?page=mnt_categoria" method="post">
    <input type="hidden" name="mode" value="{{mode}}" />
    <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
    <input type="hidden" name="catid" value="{{catid}}" />
    <fieldset>
   
    
      <label for="catproduct">Nombre</label>
      <input {{if readonly}}readonly{{endif readonly}} type="text" id="catproduct" name="catproduct" placeholder="Nombre" value="{{catproduct}}" />
      {{if error_catproduct}}
          {{foreach error_catproduct}}
            <div class="error">{{this}}</div>
          {{endfor error_catproduct}}
      {{endif error_catproduct}}
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
      window.location.href = 'index.php?page=mnt_categorias';
    });
  });
</script>