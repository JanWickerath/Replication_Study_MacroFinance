.. raw:: latex 
   
    \pagebreak

.. _introduction:

Introduction
============

The project is build using the Project templates provided by Hans-Martin von
Gaudecker at https://github.com/hmgaudecker/econ-project-templates. A general
introduction to the project-build system waf and the design of the templates
can be found at http://hmgaudecker.github.io/econ-project-templates/.

For running the entire project with waf you can run the commands

``python waf.py configure``

``python waf.py build``

``python waf.py install``

The ``configure`` command will fail if any of the programs needed is not found on
your computer. For running the scripts in the Matlab IDE alternative path settings are
included at the beginning of each script.


Code Structure
--------------

The main replication code lives in the **src** directory of the Project root
folder. It is structured in six parts:

1. original_data
2. data_management
3. analysis
4. final
5. paper
6. documentation

Those parts will be explained below.
      
