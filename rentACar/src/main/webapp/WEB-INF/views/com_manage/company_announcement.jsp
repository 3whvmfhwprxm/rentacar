<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<link rel="stylesheet" type="text/css" href='<c:url value="/css/company_an.css"/>'/>




<!-- 공지사항 -->
<div class="container">

	<div class="row">
		<div class="col-lg-8">
    	    
            <table class="table table-stripped table-bordered">
      <thead>
        <tr>
          <th>#</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Username</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>Mark
              <div class="pull-right">
        
              </div>
          </td>
          <td>Otto</td>
          <td>@mdo</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Jacob<div class="pull-right">
       
              </div></td>
          <td>Thornton</td>
          <td>@fat</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Larry<div class="pull-right">
          
              </div></td>
          <td>the Bird</td>
          <td>@twitter</td>
        </tr>
        <tr>
          <th scope="row">1</th>
          <td>Mark<div class="pull-right">
       
              </div></td>
          <td>Otto</td>
          <td>@mdo</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Jacob<div class="pull-right">
      
              </div></td>
          <td>Thornton</td>
          <td>@fat</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Larry<div class="pull-right">
     
              </div></td>
          <td>the Bird</td>
          <td>@twitter</td>
        </tr>
        <tr>
          <th scope="row">1</th>
          <td>Mark<div class="pull-right">
    
              </div></td>
          <td>Otto</td>
          <td>@mdo</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Jacob<div class="pull-right">
    




              </div></td>
          <td>the Bird</td>
          <td>@twitter</td>
        </tr>  
        <tr>
          <th scope="row">1</th>
          <td>Mark<div class="pull-right">
    
              </div></td>
          <td>Otto</td>
          <td>@mdo</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Jacob<div class="pull-right">
 >
              </div></td>
          <td>Thornton</td>
          <td>@fat</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Larry<div class="pull-right">
  
              </div></td>
          <td>the Bird</td>
          <td>@twitter</td>
        </tr>  
        <tr>
          <th scope="row">1</th>
          <td>Mark<div class="pull-right">
   
              </div></td>
          <td>Otto</td>
          <td>@mdo</td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Jacob<div class="pull-right">
   
              </div></td>
          <td>Thornton</td>
          <td>@fat</td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Larry<div class="pull-right">
   
              </div></td>
          <td>the Bird</td>
          <td>@twitter</td>
        </tr>        
      </tbody>
    </table>
    <div class="row">
        <div class="col-md-8">
            <nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">«</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">»</span>
      </a>
    </li>
  </ul>
</nav>
        </div>
        <div class="col-md-4">
            <div class="pull-right">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    <span class="glypicon glyphicon glyphicon-plus"></span>
  Add User
</button>
</div>
        </div>
    </div>
    
    
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        <h4 class="modal-title" id="myModalLabel">Add User</h4>
      </div>
      <div class="modal-body">
        <form>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="exampleInputFile">File input</label>
    <input type="file" id="exampleInputFile">
    <p class="help-block">Example block-level help text here.</p>
  </div>
  <div class="checkbox">
    <label>
      <input type="checkbox"> Check me out
    </label>
  </div>
</form>
      </div>
    
    </div>
  </div>
</div>
		</div>
        <div class="col-lg-4">
            
        </div>
	</div>
</div>


<%@ include file="../inc_company/company_bottom.jsp" %>