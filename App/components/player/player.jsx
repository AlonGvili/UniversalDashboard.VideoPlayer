import React from 'react'
import useDashboardEvent from '../../hooks/useDashboardEvent'
import ReactPlayer from 'react-player'

const UDVideoPlayer = props => {
    const [state, reload] = useDashboardEvent(props.id, props)
    const { content, attributes } = state

    return <ReactPlayer {...attributes}/>
}

export default UDVideoPlayer