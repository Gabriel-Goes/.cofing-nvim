require'soil'.setup{
    -- If you want to use Plant UML jar version instead of the install version
    -- puml_jar = "/home/ggrl/softwares/plantuml-1.2024.0.jar",

    -- If you want to customize the image showed when running this plugin
    image = {
        darkmode = false, -- Enable or disable darkmode 
        format = "svg", -- Choose between png or svg

        -- This is a default implementation of using nsxiv to open the resultant image
        -- Edit the string to use your preferred app to open the image
        -- Some examples:
        -- return "feh " .. img
        -- return "xdg-open " .. img
        execute_to_open = function(img)
            return "feh  " .. img
        end
    },
    renderer = 'imv', -- Choose between imv or feh
}
