using { sap.demo.project as my } from '../db/schema';

service ProjectService @(path:'/browse') {

  @readonly entity ProjectList as projection on Projects {
    *,
    null as qtyOfItems: Integer
  };

  entity Projects as projection on my.Projects;

}