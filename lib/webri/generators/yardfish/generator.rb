require 'webri/generators/abstract'

module WebRI

  # = Yardfish Template
  #
  class Yardfish < Generator

    #
    def html_tree
      #%[<iframe src="tree.html"></iframe>]
      @html_tree ||= (
        %[<div class="root">] + generate_html_tree(classes_toplevel) + %[</div>]   #heirarchy) #heirarchy.to_html
      )
    end

    # generate html tree
    #
    def generate_html_tree(classes)
      markup = ["<ul>"]

      classes = classes.sort{ |a,b| a.full_name <=> b.full_name }

      classes.each do |entry|
        path = entry.path  #WebRI.entry_to_path(entry.full_name)
        markup << %[
         <li class="trigger">
           <img src="assets/icon/class.png" onClick="showBranch(this);"/>
           <a class="link" href="#{path}" target="main">#{entry.name}</a>
        ]
        markup << %[<div class="branch">]

        markup << %[<ul>]
        
        cmethods, imethods = *entry.method_list.partition{ |m| m.singleton }

        cmethods = cmethods.sort{ |a,b| a.name <=> b.name }
        cmethods.each do |method|
          path = method.path   #entry.full_name + ".#{method.name}" #WebRI.entry_to_path(entry.full_name + ".#{method}")
          markup << %[
            <li class="meta_leaf">
              <a class="link" href="#{path}" target="main">#{method.name}</a>
            </li>
          ]
        end

        imethods = imethods.sort{ |a,b| a.name <=> b.name }
        imethods.each do |method|
          path = method.path   #WebRI.entry_to_path(entry.full_name + "##{method}")
          markup << %[
            <li class="leaf">
              <a class="link" href="#{path}" target="main">#{method.name}</a>
            </li>
          ]
        end

        #entry.classes.sort{ |a,b| a[0].to_s <=> b[0].to_s }.each do |(name, subspace)|
        #subspaces.each do |name, subspace|
        markup << generate_html_tree(entry.classes_and_modules) if entry.classes
        #end

        markup << %[</ul>]

        #if entry.root?
        #  markup << %[</div>]
        #else
          markup << %[</div>]
          markup << %[</li>]
        #end
      end
      markup << "</ul>"
      return markup.join("\n")
    end

    #
    def simple_files
      files.select { |f| f.parser == RDoc::Parser::Simple }
    end

    #
    def alphabetical_class_list
      classes_salient.group_by{ |klass| klass.name[0,1].upcase }.sort_by{ |x| x[0] }
    end

    #
    def alphabetical_method_list
      list = RDoc::TopLevel.all_classes_and_modules.map do |mod|
        mod.method_list
      end.flatten.sort
      list.group_by{ |meth| meth.name[0,1].upcase }.sort_by{ |x| x[0] }
    end

  end

end#module WebRI

