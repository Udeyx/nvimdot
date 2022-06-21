local present, dashboard = pcall(require, 'dashboard')

if not present then
    print("can't find dashboard")
    return
end

dashboard.preview_command = 'cat | lolcat -F 0.3'
dashboard.preview_file_path = '/home/udeyx/Pictures/hydra'
dashboard.preview_file_height = 12
dashboard.preview_file_width = 80
