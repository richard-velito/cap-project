using { managed, cuid } from '@sap/cds/common';

namespace sap.demo.project;

entity Projects : cuid, managed {
  name  : localized String(111) @title:'Project name';
  description  : localized String(1111);
  Items : Composition of many Items on Items.project = $self;
}

entity Items : cuid, managed {
  key project : Association to Projects;
  tag         : String;
  description : String;
};