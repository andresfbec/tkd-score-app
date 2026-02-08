import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app.dart';
import '../../core/theme/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.isDarkMode;

    return ScaffoldPage(
      header: PageHeader(
        title: Text(
          'Ajustes',
          style: TextStyle(
            fontSize: AppTypography.titleLarge,
            fontWeight: AppTypography.semiBold,
            fontFamily: AppTypography.fontFamily,
            color: AppColors.getTextPrimary(isDark),
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // TARJETA DE APARIENCIA
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título de sección
                    Text(
                      'Apariencia',
                      style: TextStyle(
                        fontSize: AppTypography.titleMedium,
                        fontWeight: AppTypography.semiBold,
                        color: AppColors.getTextPrimary(isDark),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Personaliza el aspecto de la aplicación',
                      style: TextStyle(
                        fontSize: AppTypography.bodySmall,
                        color: AppColors.getTextSecondary(isDark),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // TOGGLE SWITCH MODO OSCURO
                    _buildDarkModeToggle(themeProvider, isDark),
                    
                    const SizedBox(height: 24),
                    
                    // SELECTOR DE COLOR DE ACENTO
                    _buildAccentColorSelector(themeProvider, isDark),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // TARJETA DE INFORMACIÓN
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información de la aplicación',
                      style: TextStyle(
                        fontSize: AppTypography.titleMedium,
                        fontWeight: AppTypography.semiBold,
                        color: AppColors.getTextPrimary(isDark),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoItem('Nombre', AppConstants.appName, isDark),
                    _buildInfoItem('Versión', '1.0.0', isDark),
                    _buildInfoItem('Desarrollador', 'Equipo de desarrollo TKD', isDark),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================
  // TOGGLE SWITCH MODO OSCURO (SEGURO)
  // ============================================
  Widget _buildDarkModeToggle(ThemeProvider themeProvider, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isDark 
            ? Colors.grey.withOpacity(0.15)
            : Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark 
              ? Colors.grey.withOpacity(0.3) 
              : Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Información y icono
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isDark 
                      ? Colors.blue.withOpacity(0.15)
                      : Colors.orange.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isDark ? FluentIcons.clear_night : FluentIcons.sunny,
                  size: AppTypography.bodyMedium,
                  color: isDark ? Colors.blue : Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Modo oscuro',
                    style: TextStyle(
                      fontSize: AppTypography.bodyMedium,
                      fontWeight: AppTypography.semiBold,
                      color: AppColors.getTextPrimary(isDark),
                    ),
                  ),
                  Text(
                    isDark ? 'Activado' : 'Desactivado',
                    style: TextStyle(
                      fontSize: AppTypography.caption,
                      color: AppColors.getTextSecondary(isDark),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Toggle Switch
          ToggleSwitch(
            checked: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.setDarkMode(value);
            },
            content: Text(
              themeProvider.isDarkMode ? 'ON' : 'OFF',
              style: TextStyle(
                fontSize: AppTypography.caption,
                fontWeight: AppTypography.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================
  // SELECTOR DE COLOR DE ACENTO (OPCIONAL)
  // ============================================
  Widget _buildAccentColorSelector(ThemeProvider themeProvider, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color de acento',
          style: TextStyle(
            fontSize: AppTypography.bodyMedium,
            fontWeight: AppTypography.semiBold,
            color: AppColors.getTextPrimary(isDark),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Elige el color principal de la aplicación',
          style: TextStyle(
            fontSize: AppTypography.caption,
            color: AppColors.getTextSecondary(isDark),
          ),
        ),
        const SizedBox(height: 12),
        
        // Grid de colores
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (int i = 0; i < Colors.accentColors.length; i++)
                _buildColorOption(
                  color: Colors.accentColors[i],
                  isSelected: i == themeProvider.accentColorIndex,
                  onTap: () => themeProvider.setAccentColor(i),
                  isDark: isDark,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorOption({
    required AccentColor color,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            // Círculo de color
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected 
                      ? (isDark ? Colors.white : Colors.black)
                      : Colors.transparent,
                  width: isSelected ? 2.5 : 0,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: color.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
              ),
              child: isSelected
                  ? Center(
                      child: Icon(
                        FluentIcons.check_mark,
                        size: AppTypography.bodySmall,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 4),
            // Indicador seleccionado
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? color : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================
  // ITEM DE INFORMACIÓN
  // ============================================
  Widget _buildInfoItem(String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: AppTypography.bodySmall,
              color: AppColors.getTextSecondary(isDark),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: AppTypography.bodySmall,
              fontWeight: AppTypography.medium,
              color: AppColors.getTextPrimary(isDark),
            ),
          ),
        ],
      ),
    );
  }
}