import React, { useRef, useEffect } from 'react';
import { FixedSizeList as List } from 'react-window';
import InfiniteLoader from 'react-window-infinite-loader';
import Item from './item';
import Store from './store';

export default function Summary({
  // Are there more items to load?
  // (This information comes from the most recent API request.)
  hasNextPage,

  // Are we currently loading a page of items?
  // (This may be an in-flight flag in your Redux store for example.)
  isNextPageLoading,

  // Array of items loaded so far.
  items,

  // Callback function responsible for loading the next page of items.
  loadNextPage,

  sortOrder
}) {
  // We create a reference for the InfiniteLoader
  const listRef = useRef(null);
  const hasMountedRef = useRef(false);

  // Each time the sort prop changed we called the method resetloadMoreItemsCache to clear the cache
  useEffect(() => {
    if (listRef.current && hasMountedRef.current) {
      listRef.current.resetloadMoreItemsCache();
    }
    hasMountedRef.current = true;
  }, [sortOrder]);

  // If there are more items to be loaded then add an extra row to hold a loading indicator.
  const itemCount = hasNextPage ? items.length + 1 : items.length;

  // Only load 1 page of items at a time.
  // Pass an empty callback to InfiniteLoader in case it asks us to load more than once.
  const loadMoreItems = isNextPageLoading ? () => {} : loadNextPage;

  // Every row is loaded except for our loading indicator row.
  const isItemLoaded = index => !hasNextPage || index < items.length;

  // Render an item or a loading indicator.
  //const Item = ({ index, style }) => {
  //  let content;

  //  if (!isItemLoaded(index)) {
  //    content = "Loading...";
  //  } else {
  //    content = <a href="#">{items[index].name}</a>;
  //  }

  //  return (<div style={style}>{content}</div>);
  //};

  const ItemSummary = ({index}) => {
    let content;

    if (!isItemLoaded(index)) {
      content = "Loading...";
    } else {
      content = (
        <div>
          <Store store={items[index].store}></Store>
          <Item item={items[index]}></Item>
        </div>
      );
    }

    return content;
  }

  // We passed down the ref to the InfiniteLoader component
  return (
    <InfiniteLoader
      ref={listRef}
      isItemLoaded={isItemLoaded}
      itemCount={itemCount}
      loadMoreItems={loadMoreItems}>

      {({ onItemsRendered, ref }) => (
        <List
          className="item-listing"
          height={window.innerHeight}
          itemCount={itemCount}
          itemSize={30}
          onItemsRendered={onItemsRendered}
          ref={ref}
          width={540}>
          {ItemSummary}
        </List>
      )}

    </InfiniteLoader>
  );
}
