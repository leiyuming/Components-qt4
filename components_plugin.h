#ifndef COMPONENTS_PLUGIN_H
#define COMPONENTS_PLUGIN_H

#include <QDeclarativeExtensionPlugin>

class ComponentsPlugin : public QDeclarativeExtensionPlugin
{
    Q_OBJECT
    
public:
    void registerTypes(const char *uri);
    void registerBasicComponents(const char *uri);
    void initializeEngine(QDeclarativeEngine *engine, const char *uri);
};

#endif // COMPONENTS_PLUGIN_H

