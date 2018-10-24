import Foundation

class PreferenceHelper {
    
    func savePreferences() {
        let themePreference = "Dark" // This is the value
        UserDefaults.standard.set(themePreference, forKey: themePreferenceKey)
    }
    
    func loadPreferences() {
        let themePreference = UserDefaults.standard.string(forKey: themePreferenceKey)
        
        // Change the theme here based on the value of the themePreference constant's value.
    }
}
