#include "Style.h"

Style *Style::instance = NULL;
Style::Style(QObject *parent) :
    QObject(parent)
{
}

Style *Style::Instance()
{
    if (instance == NULL) {
        instance = new Style();
    }
    return instance;
}

QVariant Style::style() const
{
    return m_style;
}

void Style::setStyle(const QVariant &style)
{
    m_style = style;
    emit styleChanged();
}
